var NewNewsfeedItemForm = React.createClass({
  getInitialState: function() {
    return {content: '', tags: {water: false, waste: false, diet: false, travel: false, social: false, energy: false}};
  },
  handleContentChange: function(e) {
    this.setState({content: e.target.value});
  },
  handleCheckboxChange: function(e) {
    var value = e.target.value;
    var tags = Object.assign({}, this.state.tags);
    if (!tags[value]) {
      tags[value] = true;
    } else {
      tags[value] = false;
    }
    this.setState({tags: tags});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var content = this.state.content.trim();
    var tags = this.emptyOrPresentTags();
    if (!content) {
      return;
    }
    this.props.onNewsfeedItemSubmit({newsfeed_item: {source_id: this.props.currentProfileID, source_type: "profile", content: content}, tags: tags});
    this.setState({content: '', tags: {water: false, waste: false, diet: false, travel: false, social: false, energy: false}});
  },
  emptyOrPresentTags: function() {
    var tags = this.state.tags;
    var returnedTags = {};
    for (var key in tags) {
      if (tags[key]) {
        returnedTags[key] = tags[key];
      }
    }
    return returnedTags;
  },
  render: function() {
    return (
      <div className="o-bubble o-bubble--full o-bubble--no-pad o-bubble--with-heading c-newsfeed-composer">

        <form onSubmit={this.handleSubmit}>

          <div className="o-media">

            <img className="o-img--small o-img--round o-media__img c-newsfeed-composer__img" src={this.props.currentProfilePhoto} /> 

            <div className="o-media__bd c-newsfeed-composer__bd">
              <textarea 
                className="c-newsfeed-composer__text-area" 
                rows="2" 
                placeholder="What's nu with you?"
                value={this.state.content}
                onChange={this.handleContentChange}
                ></textarea>
            </div>

          </div>

          <div className="c-newsfeed-composer__tag-submit">
            <ul className="o-inline-list c-newsfeed-composer__tag-list">

              <li className="o-inline-list__li c-newsfeed-composer__tag-list__prompt">
                Add tags <sup>*</sup>
              </li>

              <li className="o-inline-list__li c-newsfeed-composer__tag-list__tag">
                <label>
                  <input
                    type="checkbox"
                    value="water"
                    name="tags[water]"
                    checked={this.state.tags.water}
                    onChange={this.handleCheckboxChange}
                  />
                  Water
                </label>
              </li>

              <li className="o-inline-list__li c-newsfeed-composer__tag-list__tag">
                <label>
                  <input
                    type="checkbox"
                    value="waste"
                    name="tags[waste]"
                    checked={this.state.tags.waste}
                    onChange={this.handleCheckboxChange}
                  />
                  Waste
                </label>
              </li>

              <li className="o-inline-list__li c-newsfeed-composer__tag-list__tag">
                <label>
                  <input
                    type="checkbox"
                    value="diet"
                    name="tags[diet]"
                    checked={this.state.tags.diet}
                    onChange={this.handleCheckboxChange}
                  />
                  Diet
                </label>
              </li>

              <li className="o-inline-list__li c-newsfeed-composer__tag-list__tag">
                <label>
                  <input
                    type="checkbox"
                    value="travel"
                    name="tags[travel]"
                    checked={this.state.tags.travel}
                    onChange={this.handleCheckboxChange}
                  />
                  Travel
                </label>
              </li>

              <li className="o-inline-list__li c-newsfeed-composer__tag-list__tag">
                <label>
                  <input
                    type="checkbox"
                    value="energy"
                    name="tags[energy]"
                    checked={this.state.tags.energy}
                    onChange={this.handleCheckboxChange}
                  />
                  Energy
                </label>
              </li>

              <li className="o-inline-list__li c-newsfeed-composer__tag-list__tag">
                <label>
                  <input
                    type="checkbox"
                    value="social"
                    name="tags[social]"
                    checked={this.state.tags.social}
                    onChange={this.handleCheckboxChange}
                  />
                  Social
                </label>
              </li>

            </ul>
          </div>

          <div className="c-newsfeed-composer__submit">
            <input 
              type="submit" 
              value="Post"
            />
          </div>

        </form>


      </div>
    );
    
  }
});