'use strict';

const puppeteer = require('puppeteer');
const fs = require("fs");
const {createCanvas} = require('canvas');

const publicDir = './public';

(async () => {
    const browser = await puppeteer.launch({
        args: [
            '--no-sandbox',
            '--disable-setuid-sandbox'
        ]
    });
    const page = await browser.newPage();
    await page.goto('http://example.com');
    await page.screenshot({path: `${publicDir}/puppeteer_example.png`});
    await browser.close();

    const canvas = createCanvas(200, 200);
    const g = canvas.getContext("2d");
    g.fillStyle = "black";
    g.fillRect(0, 0, 100, 100);
    const buf = canvas.toBuffer();
    fs.writeFileSync(`${publicDir}/canvas-example.png`, buf);
})();