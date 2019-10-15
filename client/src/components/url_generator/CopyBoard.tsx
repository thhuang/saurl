import React, { Component } from 'react';
import CopyToClipboard from 'react-copy-to-clipboard';
import Nothing from '../../interfaces/Nothing.interface';

interface ICopyBoardProps {
  text: string
}

export class CopyBoard extends Component<ICopyBoardProps, Nothing> {
  render() {
    return (
      <div className="ui action input">
        <input value={this.props.text} readOnly />
        <CopyToClipboard text={this.props.text}>
          <button className="ui blue right labeled icon button">
            <i className="copy icon"></i>
            Copy
          </button>
        </CopyToClipboard>
      </div>
    )
  }
}

export default CopyBoard
