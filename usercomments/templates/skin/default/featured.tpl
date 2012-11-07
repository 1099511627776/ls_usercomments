{foreach from=$aComments item=oComment}
{assign var="oTopic" value=$oComment->getTarget()}
<div class="comment">
	<div class="avatar">
		<a href="{$oComment->getUser()->getUserWebPath()}" title="#"><img src="{$oComment->getUser()->getProfileAvatar()}" alt="avatar"></a>
	</div>
	<div class="border-comment">
		<div class="content">
			<div class="arrow">
			</div>
			<div class="padding">
				<ul class="info">
					<li class="username"><a href="{$oComment->getUser()->getUserWebPath()}">{$oComment->getUser()->getLogin()}</a></li>
					<li class="date">{$oComment->getDate()}</li>
					<li><a href="{$oTopic->getUrl()}#comment{$oComment->getId()}" class="reply-link">{$aLang.go_to_comment}</a></li>
				</ul>
				<div class="text-style">
				{$oComment->getText()}
				</div>
			</div>
		</div>
	</div>
</div>
{/foreach}
