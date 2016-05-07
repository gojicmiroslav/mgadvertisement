import Constants from '/flux_app/constants'
import AppDispatcher from '/flux_app/app_dispatcher'
import Api from "/flux_app/api";

class Actions {
	static addComment(params){
		Api.post('/advertisements/1/comments', {
			comment: params
		}).then(resp => {
			return resp.json();
		}).then(comment => {
			AppDispatcher.dispatch({
				actionType: Constants.ADD_COMMENT,
				comment: comment
			});
		});
	}

	static setComments(params){
		AppDispatcher.dispatch({
			actionType: Constants.SET_COMMENTS,
			comments: params
		});
	}

	static upvoteComment(comment){
		Api.put(`/advertisements/1/comments/${comment.id}/upvote`).then(function(resp){
			return resp.json();
		}).then(function(comment){
			AppDispatcher.dispatch({
				actionType: Constants.UPVOTE_COMMENT,
				comment: comment
			});
		});
	}
}

export default Actions;