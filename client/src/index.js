import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import registerServiceWorker from './registerServiceWorker';

ReactDOM.render(<App />, document.getElementById('root'));
registerServiceWorker();

// npm start
//   Starts the development server.
//
// npm run build
//   Bundles the app into static files for production.
//
// npm test
//   Starts the test runner.
