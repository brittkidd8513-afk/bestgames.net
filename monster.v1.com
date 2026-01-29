<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Simple Web Proxy</title>
  <style>
    body {
      background: #0f172a;
      color: #e5e7eb;
      font-family: Arial, sans-serif;
      text-align: center;
      padding: 40px;
    }

    input {
      width: 60%;
      padding: 12px;
      font-size: 16px;
      border-radius: 6px;
      border: none;
    }

    button {
      padding: 12px 20px;
      font-size: 16px;
      margin-left: 10px;
      cursor: pointer;
      border-radius: 6px;
      border: none;
      background: #38bdf8;
      color: #000;
    }

    iframe {
      margin-top: 30px;
      width: 90%;
      height: 70vh;
      border: 2px solid #38bdf8;
      border-radius: 10px;
      background: white;
    }
  </style>
</head>
<body>

  <h1>🔁 Web Proxy</h1>
  <p>Enter a URL to load through the proxy</p>

  <input id="url" placeholder="https://example.com" />
  <button onclick="loadSite()">Go</button>

  <iframe id="viewer"></iframe>

  <script>
    function loadSite() {
      const url = document.getElementById("url").value;
      if (!url) return alert("Enter a URL");

      // This assumes you have a backend proxy at /proxy
      document.getElementById("viewer").src =
        `/proxy?url=${encodeURIComponent(url)}`;
    }
  </script>

</body>
</html>
