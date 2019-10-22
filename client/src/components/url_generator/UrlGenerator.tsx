import React, { Component } from 'react';
import UrlQuery from '../../interfaces/UrlQuery.interface';
import Nothing from '../../interfaces/Nothing.interface';
import SearchBar from './SearchBar';
import CopyBoard from './CopyBoard';
import saurl from '../../api/saurl';

interface IUrlGeneratorState extends UrlQuery {
  shortUrl: string
}

export class UrlGenerator extends Component<Nothing, IUrlGeneratorState> {
  state = {
    userId: 'anonymous',
    longUrl: '',
    shortUrl: '',
  }

  onUrlSubmit = async (longUrl: string): Promise<void> => {
    try {
      const response = await saurl.post('shorturls/', {
        long_url: longUrl,
        user_id: this.state.userId
      });

      this.setState({
        longUrl: longUrl,
        shortUrl: response.data.short_url,
      });
    } catch (e) {
      console.log(e);
    }
  };

  render() {
    return (
      <div className="panel">
        <SearchBar onSubmit={this.onUrlSubmit} />
        <CopyBoard shortUrl={this.state.shortUrl} />
      </div>
    )
  }
}

export default UrlGenerator
