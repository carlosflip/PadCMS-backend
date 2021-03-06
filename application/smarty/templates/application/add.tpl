{include file="includes/header.tpl"}

{capture name=js}
<script type="text/javascript" src="/js/application/add.js"></script>
{/capture}
<div id="main">
<div id="main-inner" class="clear-block">

<div id="content-header">
    <div id="content-header-inner">
        {include file=includes/breadcrumbs.tpl}
    </div>
</div>

<div id="content">
    <div id="content-inner">
        <div id="content-area">
            <div class="cblock-form cblock-signin cblock-add-app error-detected">
                <div class="cblock-form-mandatory">{'Mandatory fields'|translate} *</div>
                <div class="cblock-form-inner">

                    {if isset($application) && $application.errors}
                    <div class="errors-block">
                        <div class="error-top"></div>
                        <div class="error-mid">
                            <div class="inner">
                                <h2 class="title">{'Errors'|translate}</h2>
                                <ul>
                                    {foreach from=$application.errors item=error}
                                    <li>{$error|escape:"html"}</li>
                                    {/foreach}
                                </ul>
                            </div>
                        </div>
                        <div class="error-bot"></div>
                    </div>
                    {/if}

                    <form method="POST" enctype="multipart/form-data" action="">
                        <input type="hidden" name="form" value="{if isset($application)}{$application.name}{/if}"/>

                        <div class="form-item{if isset($title) && $title.errors} error{/if}">
                            <label>{if isset($title)}{$title.title|escape}{/if} <span>*</span></label>
                            <div class="form-item-wrapper">
                                <input type="text" name="{if isset($title)}{$title.name}{/if}" value="{if isset($title)}{$title.value|escape}{/if}" class="form-text"/>
                            </div>
                            <div class="clr"></div>
                            <div class="description">
                                {'A short title for your application, used internally only. Example : '|translate}
                                <i>{'Wired :)'|translate}</i>
                            </div>
                        </div>

                        <div class="form-item{if isset($product_id) && $product_id.errors} error{/if}">
                            <label>{if isset($product_id)}{$product_id.title|escape}{/if}</label>
                            <div class="form-item-wrapper">{if isset($product_id)}{include file="Volcano/input.tpl" control=$product_id _class="form-text"}{/if}</div>
                            <div class="clr"></div>
                            <div class="description">
                                {'Product ID like '|translate} com.adyax.padcms.PRODUCT_NAME
                            </div>
                        </div>

                        <div class="form-item{if isset($version) && $version.errors} error{/if}">
                            <label>{if isset($version)}{$version.title|escape}{/if} <span>*</span></label>
                            <div class="form-item-wrapper">{if isset($version)}{include file="Volcano/input.tpl" control=$version _class="form-text"}{/if}</div>
                            <div class="clr"></div>
                            <div class="description">
                                {'Use versioning to be keep track of your internal updates. Optional field. Example : '|translate}
                                <i>{'1.0'|translate}</i>
                            </div>
                        </div>

                        <div class="form-item{if isset($description) && $description.errors} error{/if}">
                            <label>{if isset($description)}{$description.title|escape}{/if} <span>*</span></label>
                            <div class="textarea-wrapper">{if isset($description)}{include file="Volcano/textarea.tpl" control=$description _rows=3 _cols=45 _class="form-textarea" _additional="title='"|cat:'Application description ...'|translate|cat:"'"}{/if}</div>
                            <div class="clr"></div>
                            <div class="description">
                                {'Very usefull if you have many applications and title is not clear enough. Example : '|translate}
                                <i>{'A nice magazine about life-style, decoration and cooking...'|translate}</i>
                            </div>
                        </div>
                        <div id="share-tabs">
                            <ul>
                                <li><a href="#tab-1">iOS</a></li>
                                <li><a href="#tab-2">Android</a></li>
                            </ul>
                            <div id="tab-1">
                                <h2>{'Email notification for iOS'|translate}</h2>
                                <div class="form-item{if isset($nt_email_ios) && $nt_email_ios.errors} error{/if}">
                                    <label>{if isset($nt_email_ios)}{$nt_email_ios.title|translate|escape}{/if}</label>
                                    <div class="form-item-wrapper">{if isset($nt_email_ios)}{include file="Volcano/input.tpl" control=$nt_email_ios _class="form-text"}{/if}</div>
                                </div>

                                <div class="form-item{if isset($nm_email_ios) && $nm_email_ios.errors} error{/if}">
                                    <label>{if isset($nm_email_ios)}{$nm_email_ios.title|translate|escape}{/if}</label>
                                    <div class="textarea-wrapper">{if isset($nm_email_ios)}{include file="Volcano/textarea.tpl" control=$nm_email_ios _rows=3 _cols=45 _class="form-textarea"}{/if}</div>
                                </div>

                                <h2>{'Twitter notification for iOS'|translate}</h2>
                                <div class="form-item{if isset($nm_twitter_ios) && $nm_twitter_ios.errors} error{/if}">
                                    <label>{if isset($nm_twitter_ios)}{$nm_twitter_ios.title|translate|escape}{/if}</label>
                                    <div class="textarea-wrapper">{if isset($nm_twitter_ios)}{include file="Volcano/textarea.tpl" control=$nm_twitter_ios _rows=3 _cols=45 _class="form-textarea"}{/if}</div>
                                </div>

                                <h2>{'Facebook notification for iOS'|translate}</h2>
                                <div class="form-item{if isset($nm_fbook_ios) && $nm_fbook_ios.errors} error{/if}">
                                    <label>{if isset($nm_fbook_ios)}{$nm_fbook_ios.title|translate|escape}{/if}</label>
                                    <div class="textarea-wrapper">{if isset($nm_fbook_ios)}{include file="Volcano/textarea.tpl" control=$nm_fbook_ios _rows=3 _cols=45 _class="form-textarea"}{/if}</div>
                                </div>
                            </div>
                            <div id="tab-2">
                                <h2>{'Email notification for Android'|translate}</h2>
                                <div class="form-item{if isset($nt_email_android) && $nt_email_android.errors} error{/if}">
                                    <label>{if isset($nt_email_android)}{$nt_email_android.title|translate|escape}{/if}</label>
                                    <div class="form-item-wrapper">{if isset($nt_email_android)}{include file="Volcano/input.tpl" control=$nt_email_android _class="form-text"}{/if}</div>
                                </div>
                                <div class="form-item{if isset($nm_email_android) && $nm_email_android.errors} error{/if}">
                                    <label>{if isset($nm_email_android)}{$nm_email_android.title|translate|escape}{/if}</label>
                                    <div class="textarea-wrapper">{if isset($nm_email_android)}{include file="Volcano/textarea.tpl" control=$nm_email_android _rows=3 _cols=45 _class="form-textarea"}{/if}</div>
                                </div>

                                <h2>{'Twitter notification for Android'|translate}</h2>
                                <div class="form-item{if isset($nm_twitter_android) && $nm_twitter_android.errors} error{/if}">
                                    <label>{if isset($nm_twitter_android)}{$nm_twitter_android.title|translate|escape}{/if}</label>
                                    <div class="textarea-wrapper">{if isset($nm_twitter_android)}{include file="Volcano/textarea.tpl" control=$nm_twitter_android _rows=3 _cols=45 _class="form-textarea"}{/if}</div>
                                </div>

                                <h2>{'Facebook notification for Android'|translate}</h2>
                                <div class="form-item{if isset($nm_fbook_android) && $nm_fbook.errors_android} error{/if}">
                                    <label>{if isset($nm_fbook_android)}{$nm_fbook_android.title|translate|escape}{/if}</label>
                                    <div class="textarea-wrapper">{if isset($nm_fbook_android)}{include file="Volcano/textarea.tpl" control=$nm_fbook_android _rows=3 _cols=45 _class="form-textarea"}{/if}</div>
                                </div>
                            </div>
                        </div>

                        <div class="block-clear cblock-buttons">
                            <input type="submit" class="orange-but" value="{'Save'|translate}" />
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<div id="content-foot">
    <div id="content-foot-inner"></div>
</div>

</div>
</div>

{include file="includes/footer.tpl"}
