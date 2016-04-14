var Comment = React.createClass({
	propTypes: {
		author: React.PropTypes.string,
		body: React.PropTypes.string,
    created_at: React.PropTypes.string
	},

  render: function() {
    return (
    	<div className="panel panel-default">
    		<div className="panel-heading">
          <p><b>Posted:</b> { this.props.created_at }</p>
          <p className="text-primary"><b>Author: <i>{this.props.author}</i></b></p>
        </div>
    		<div className="panel-body">{this.props.body}</div>
    	</div>
    );
  }
});
