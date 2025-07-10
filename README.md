# Pure Node.js + HTML App

A simple, lightweight web application built with pure Node.js and vanilla HTML/CSS/JavaScript. No frameworks, no dependencies, no build tools!

## Features

- 🚀 **Zero Dependencies**: Pure Node.js using only built-in modules
- 📱 **Responsive Design**: Works great on desktop and mobile devices
- 🎨 **Modern UI**: Beautiful gradient design with glassmorphism effects
- 🔄 **Interactive**: Real-time form submission and client-side functionality
- ⚡ **Ultra Fast**: No build process, no bundling, just serve files directly

## Project Structure

```
parent-app/
├── server.js          # Pure Node.js HTTP server
├── public/            # Static files
│   ├── index.html     # Main HTML page
│   ├── input.html     # Parent application with iframe
│   ├── styles.css     # CSS styles
│   └── script.js      # Client-side JavaScript
└── README.md          # This file
```

## Getting Started

### Prerequisites

- Node.js (version 14 or higher)

### Installation & Running

1. **No installation needed!** Just run:
   ```bash
   node server.js
   ```

2. **Open your browser:**
   Navigate to `http://localhost:3001`

That's it! No `npm install`, no dependencies, no build process.

## Available Pages

- **Home Page**: `http://localhost:3001/` or `http://localhost:3001/index.html`
- **Parent App**: `http://localhost:3001/input.html` - URL input with iframe embedding

## Features Explained

### Frontend
- **Responsive Design**: Uses CSS Grid and Flexbox for layout
- **Modern Styling**: Gradient backgrounds, glassmorphism effects, smooth animations
- **Interactive Elements**: Button hover effects, form validation, loading states
- **Iframe Integration**: Dynamic URL loading in embedded iframe

### Backend
- **Pure Node.js Server**: Uses built-in `http` and `fs` modules
- **Static File Serving**: Automatically serves HTML, CSS, JS, and other static files
- **MIME Type Support**: Proper content-type headers for all file types
- **Error Handling**: 404 and 500 error responses

## How It Works

The server:
1. Listens for HTTP requests on port 3001
2. Maps URLs to files in the `public/` directory
3. Serves files with appropriate MIME types
4. Handles errors gracefully

## Customization

### Adding New Pages
1. Create a new HTML file in the `public/` directory
2. Access it directly via URL (e.g., `public/about.html` → `http://localhost:3001/about.html`)

### Adding New File Types
1. Add the file extension and MIME type to the `mimeTypes` object in `server.js`
2. Place your files in the `public/` directory

### Styling Changes
- Modify `public/styles.css` for visual changes
- The CSS uses modern features like CSS Grid, Flexbox, and gradients

## Development Tips

- Just edit files and refresh your browser - no build step needed!
- Check the browser console for client-side logs
- Check the terminal for server-side logs
- Use browser dev tools to inspect network requests

## Deployment

This app can be deployed anywhere that supports Node.js:

- **Heroku**: Add a `Procfile` with `web: node server.js`
- **Vercel**: Configure for Node.js deployment
- **Railway**: Direct deployment from GitHub
- **DigitalOcean App Platform**: Simple container deployment
- **Any VPS**: Just upload files and run `node server.js`

## Why Pure Node.js?

- **No Dependencies**: Faster startup, smaller deployment size
- **No Build Process**: Instant development, no waiting for compilation
- **Simple Debugging**: Clear, readable code without framework abstractions
- **Learning**: Perfect for understanding HTTP and web fundamentals
- **Performance**: Minimal overhead, maximum speed

## License

MIT License - feel free to use this as a starting point for your projects!

## Contributing

Feel free to fork this project and make improvements. This is a great starting point for learning Node.js and web development fundamentals without the complexity of frameworks. # embed
