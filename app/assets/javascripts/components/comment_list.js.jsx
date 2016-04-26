var CommentList = React.createClass({

	componentDidMount: function(){
		Store.addChangeListener(this._onChange);
	},

	componentWillUnmount: function(){
		Store.removeChangeListener(this._onChange);
	},

	_onChange: function(){
		this.forceUpdate();
	},

  render: function() {
  	console.log("Render...");
    return (
    	<div>
    		{ Store.comments().map(function(comment){
    			return <Comment key={comment.id} {... comment} />
    		})};
    	</div>
    );
  }
});
