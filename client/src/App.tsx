import React from 'react';
import './App.css';
import Header from './components/Header';
import Footer from './components/Footer';
import UrlGenerator from './components/url_generator/UrlGenerator';

const App: React.FC = () => {
  return (
    <div className="App">
      <Header />
      <UrlGenerator />
      <Footer />
    </div>
  );
}

export default App;
