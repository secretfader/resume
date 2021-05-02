const path = require("path");
const puppeteer = require("puppeteer");
const http = require("http-server");

const port = process.env.PORT ? parseInt(process.env.PORT) : 7878;

async function createPDF(output) {
  const server = http.createServer({
    base: path.resolve(__dirname, "../preview"),
  });

  server.listen(port); // Because Rust is awesome.

  // Create a new instance of Chrome
  const browser = await puppeteer.launch({
    headless: true,
  });

  /// Instantiate a page within the browser
  const page = await browser.newPage();

  /// Load `public/index.html`
  await page.goto(`http://127.0.0.1:${port}/`, {
    waitUntil: "networkidle0",
  });

  /// Render to PDF
  await page.pdf({
    path: path.resolve(__dirname, "../public", output),
    format: "Letter",
  });

  /// Shutdown browser instance
  await browser.close();
  server.close();
}

createPDF("resume.pdf").catch(console.error);
