import React, { Component } from 'react';
import CopyToClipboard from 'react-copy-to-clipboard';
import Nothing from '../../interfaces/Nothing.interface';

interface ICopyBoardProps {
  shortUrl: string
}

export class CopyBoard extends Component<ICopyBoardProps, Nothing> {
  render() {
    return (
      <div className="ui container copy-board">
        <div className="ui fluid action input">
          <div className="ui icon button grey basic">
            Shorten URL >>
          </div>
          <input value={this.props.shortUrl} readOnly />
          <CopyToClipboard text={this.props.shortUrl}>
            <button className="ui icon button grey">
              <i className="copy icon"></i>
            </button>
          </CopyToClipboard>
        </div>
      </div>
    )
  }
}

export default CopyBoard
