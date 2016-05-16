import Constants from '/flux_app/constants'
import AppDispatcher from '/flux_app/app_dispatcher'

class CommentStore extends EventEmitter {
	constructor(){
		super();
		this._comments = [];
		this.setMaxListeners(100);

		AppDispatcher.register((payload) => {
			switch(payload.actionType){
				case Constants.ADD_COMMENT:
					this.addComment(payload.comment);
					this.emitChange();
					break;
				case Constants.SET_COMMENTS:
					this.setComments(payload.comments);
					this.emitChange();
					break;
				case Constants.UPVOTE_COMMENT:
					this.upvote(payload.comment);
					this.emitChange();
					break;
				default:
					// NO-OP
			}
		});
	}

	setComments(comments){
		console.log('CommentStore: ' + comments);
		// comments.forEach(comment => {
		// 	this.addComment(comment);
		// });

		for(var i = 0; i < comments.length; i++){
    	this.addComment(comments[i]);
    }
	}

	addComment(comment){
		this._comments[comment.id || this._comments.length] = comment;
	}

	upvote(comment){
		this._comments[comment.id].rank++;
	}

	comments(parentId){
		return this._comments.filter(c => {
			return c && c.parent_id === parentId;
		});
	}

	addChangeListener(callback){
		this.on(Constants.CHANGE_EVENT, callback);
	}

	removeChangeListener(callback){
		this.removeListener(Constants.CHANGE_EVENT, callback);
	}

	emitChange(){
		this.emit(Constants.CHANGE_EVENT);
	}
}

export default CommentStore;