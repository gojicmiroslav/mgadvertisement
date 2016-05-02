import Comment from '/components/comment';

class CommentList extends React.Component { 

  static get contextTypes(){
    return {
      store: React.PropTypes.object.isRequired
    }
  }

	componentDidMount(){
		this.context.store.addChangeListener(this._onChange.bind(this));
	}

	componentWillUnmount(){
		this.context.store.removeChangeListener(this._onChange.bind(this));
	}

	_onChange(){
		this.forceUpdate();
	}

  render(){
  	console.log("Render...");
    return (
    	<div>
    		{ this.context.store.comments().map((comment, i) => {
    			return <Comment key={i} {... comment} />
    		})};
    	</div>
    );
  }
}

export default CommentList;