const puppeteer = require('puppeteer')
const express = require('express')
const app = express()
const port = 3000

app.use(express.static('_site'))

const server = app.listen(port, () => {
  pdfify()
})


async function pdfify() {

    const browser = await puppeteer.launch({ args: ["--allow-file-access-from-files"]})
    const page = await browser.newPage()

    await page
        .on('console', message => console.log(`${message.type().substr(0, 3).toUpperCase()} ${message.text()}`))
        .on('pageerror', ({ message }) => console.log(message))
        .on('response', response => console.log(`${response.status()} ${response.url()}`))
        .on('requestfailed', request => console.log(`${request.failure().errorText} ${request.url()}`))

    await page
        .goto(`http://localhost:3000/latest/`, { waitUntil: ['domcontentloaded', 'networkidle0', 'load'] })

    console.log('waiting a little longer')

    await new Promise(resolve => setTimeout(resolve, 10000));

    await page.pdf({ path: '_site/latest.pdf', format: 'A4' })
            .then(function (res) {
              browser.close();
            }).catch(function (e) {
              browser.close();
            })


    console.log('success!')
    server.close(() => {
      console.log('HTTP server closed')
    } )


}
