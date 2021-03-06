import Actions from '/flux_app/actions';
import CommentStore from '/flux_app/stores/comment_store';
import CommentList from '/components/comment_list';
import CommentForm from '/components/comment_form';

class CommentSection extends React.Component{

	constructor(props){
		super();
		this.store = new CommentStore();
		this.actions = new Actions(props.advertisementId);
		this.actions.setComments(JSON.parse(props.comments));
	}

	static get childContextTypes(){
		//tell the children that there is a object named store at there disposal
		return {
			store: React.PropTypes.object.isRequired,
			actions: React.PropTypes.object.isRequired
		}
	}

	//The getChildContext function will be called when the state or props changes
	getChildContext(){
		return {
			store: this.store,
			actions: this.actions
		}
	}

	
	render(){
		return (
			<div>
				<CommentForm isReplying={true} />
				<hr />
				<CommentList parent_id={null} />
			</div>
		);
	}

}

window.CommentSection = CommentSection;
export default CommentSection;