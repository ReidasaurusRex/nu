var NewNewsfeedItemForm = React.createClass({
  getInitialState: function() {
    return {content: ''};
  },
  handleContentChange: function(e) {
    this.setState({content: e.target.value});
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var content = this.state.content.trim();
    if (!content) {
      return;
    }
    this.props.onNewsfeedItemSubmit({newsfeed_item: {source_id: this.props.currentProfileID, source_type: "profile", content: content}});
    this.setState({content: ''});
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