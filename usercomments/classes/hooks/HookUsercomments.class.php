<?php

class PluginUsercomments_HookUsercomments extends Hook {

    /*
     * Регистрация событий на хуки
	*/
    public function RegisterHook() {
        $this->AddHook('template_user_comments', 'displayComments',__CLASS__);
    }
	
	public function displayComments(){
		$s = '';
		if(Router::GetActionEventName()=='EventWhois') {
			$sUserLogin = Router::GetActionEvent();
			if (($oUserProfile=$this->User_GetUserByLogin($sUserLogin))) {

				$aResult=$this->Comment_GetCommentsByUserId($oUserProfile->getId(),'topic',1,Config::Get('plugin.usercomments.comments_per_page'));
				$this->Viewer_Assign('aComments',$aResult['collection']);
				$s = $this->Viewer_Fetch(Plugin::GetTemplatePath('usercomments').'featured.tpl');
			}
		 }
        return $s;
	}
}
?>
