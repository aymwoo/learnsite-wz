const fs = require('fs');
const { chromium } = require('playwright');

(async () => {
  // Read the modified ASPX file
  let content = fs.readFileSync('student/myrule.aspx', 'utf8');

  // Convert ASPX to HTML for Playwright testing
  // Remove <%@ Page ... %> directive
  content = content.replace(/<%@\s*Page[^>]*%>\s*/g, '');

  // Remove <form runat="server"> and related
  content = content.replace(/<form[^>]*runat="server"[^>]*>/gi, '<div>');
  content = content.replace(/<\/form>/gi, '</div>');

  // Replace <asp:Button> with standard HTML <button>
  content = content.replace(
    /<asp:Button[^>]*ID="([^"]+)"[^>]*Text="([^"]+)"[^>]*BorderStyle="None"[^>]*CssClass="([^"]+)"[^>]*Width="([^"]+)"[^>]*\/>/gi, 
    '<button id="$1" class="$3" style="width: $4;">$2</button>'
  );

  // Remove other runat="server" attributes
  content = content.replace(/runat="server"/gi, '');

  // Add some mock CSS for .ground class which loads from 'ground.jpg' normally
  content = content.replace(
      '</head>',
      '<style>.ground { background-color: #f0f0f0; }</style></head>'
  );

  // Write to temporary HTML file
  fs.writeFileSync('student/myrule.html', content);

  console.log('Created static HTML file for verification.');

  // Use Playwright to take a screenshot
  const browser = await chromium.launch();
  const page = await browser.newPage();
  
  // Navigate to the local HTML file
  await page.goto(`file://${process.cwd()}/student/myrule.html`);
  
  // Ensure the page is rendered
  await page.waitForTimeout(1000);

  // Take screenshot
  await page.screenshot({ path: 'screenshot.png', fullPage: true });

  await browser.close();
  console.log('Screenshot saved to screenshot.png');
})();
