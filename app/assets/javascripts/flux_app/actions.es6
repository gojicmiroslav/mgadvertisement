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
}

export default Actions;