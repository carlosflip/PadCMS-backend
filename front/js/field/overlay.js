/**
 * Copyright (c) PadCMS (http://www.padcms.net)
 *
 * Licensed under the CeCILL-C license
 * http://www.cecill.info/licences/Licence_CeCILL-C_V1-en.html
 * http://www.cecill.info/licences/Licence_CeCILL-C_V1-fr.html
 */
var fieldOverlay = {
    pageId: null,
    fieldId: null,
    uploader: null,
    domRoot: null,

    init: function() {
        var context = this;

        context.domRoot = $('#field-overlay')[0];

        if (!context.domRoot) {
            return;
        }

        context.pageId = document.pid;
        context.fieldId = $("input[name='field-id']", context.domRoot).val();

        $('a.close', context.domRoot).bind('click', context, function(event){
            return event.data.onDelete(event.originalEvent);
        });

        $("a.single_image", context.domRoot).fancybox();

        $('input.resource-overlay').change(function(event){
            $('.upload-form-overlay').ajaxSubmit({
                data: {
                    page_id:  context.pageId,
                    field_id: context.fieldId
                },
                dataType: 'json',
                success: function(responseJSON) {
                    if (!responseJSON.status) {
                        if (responseJSON.message) {
                            alert(responseJSON.message);
                        } else {
                            alert(translate('Error. Can\'t upload file'));
                        }
                    } else {
                        var file = responseJSON.file;

                        //Unset field value
                        $('input.resource-overlay').val(null);

                        var image = null;
                        if (file.smallUri && file.bigUri) {
                            image =
                            '<a class="single_image" href="' + file.bigUri + '">' +
                            '<img alt="' + file.fileName + '" src="' + file.smallUri + '"/>' +
                            '</a>';
                        } else {
                            image = '<img alt="' + file.fileName + '" src="' + file.smallUri + '"/>';
                        }

                        var divPicture = $('div.picture', context.domRoot);
                        $(divPicture).html(image);

                        $('a.close', $(divPicture).parent())
                                .attr('href', '/field/delete/key/resource/element/' + responseJSON.element)
                                .show();
                        $('span.name', $(divPicture).parent())
                                .html(file.fileNameShort)
                                .attr('title', file.fileName);

                        $("a.single_image", context.domRoot).fancybox();
                    }
                }
            });
        });
    },

    onDelete: function(event) {
        var context = this;
        url = $(event.target).attr('href');
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            success: function(data) {
                try {
                    if (data.status == 1) {
                        var divPicture = $('div.picture', context.domRoot);
                        var html = '<img alt="Default image" src="' + data.defaultImageUri + '"/>';
                        $(divPicture).html(html);
                        $('a.close', $(divPicture).parent())
                                .hide()
                                .attr('href', '');
                        $('span.name', $(divPicture).parent()).empty();
                    } else {
                        alert(data.message);
                    }
                } catch (e) {
                    window.ui.log(e);
                    alert(translate('unexpected_error'));
                }
            }
        });
        return false;
    },

    clear: function() {
        $(this.domRoot).empty();
    },

    update: function() {
        var context = this;
        $.ajax({
            url: '/field-overlay/show',
            type: 'POST',
            dataType: 'html',
            data: {
                page_id: context.pageId,
                field_id: context.fieldId
            },
            success: function(data) {
                context.clear();
                $(context.domRoot).html(data);
                context.init();
            }
        });
    }
}