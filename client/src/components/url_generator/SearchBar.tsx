import React, { Component } from 'react';

interface ISearchBarProps {
  onSubmit(longUrl: string): Promise<void> 
};

interface ISearchBarState {
  longUrl: string
}

export class SearchBar extends Component<ISearchBarProps, ISearchBarState> {
  state = {longUrl: ''};

  onFormSubmit = (
    event: React.FormEvent<HTMLFormElement>
  ) => {
    event.preventDefault();

    const longUrl: string = this.state.longUrl;
    this.props.onSubmit(longUrl);
    
    this.setState({longUrl: ''});
  };

  render() {
    return (
      <div className="ui container search-bar">
        <form onSubmit={this.onFormSubmit} className="ui form">
          <div className="ui fluid action input">
            <input 
              type="text"
              placeholder="Your long long long long URL..."
              value={this.state.longUrl}
              onChange={e => this.setState({longUrl: e.target.value})}
             />
            <button className="ui button" >
              Shorten
            </button>
          </div>

        </form>
      </div>
    );
  }
}

export default SearchBar
