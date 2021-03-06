<?php
/**
 * @file
 * AM_Model_Db_FieldType class definition.
 *
 * LICENSE
 *
 * This software is governed by the CeCILL-C  license under French law and
 * abiding by the rules of distribution of free software.  You can  use,
 * modify and/ or redistribute the software under the terms of the CeCILL-C
 * license as circulated by CEA, CNRS and INRIA at the following URL
 * "http://www.cecill.info".
 *
 * As a counterpart to the access to the source code and  rights to copy,
 * modify and redistribute granted by the license, users are provided only
 * with a limited warranty  and the software's author,  the holder of the
 * economic rights,  and the successive licensors  have only  limited
 * liability.
 *
 * In this respect, the user's attention is drawn to the risks associated
 * with loading,  using,  modifying and/or developing or reproducing the
 * software by the user in light of its specific status of free software,
 * that may mean  that it is complicated to manipulate,  and  that  also
 * therefore means  that it is reserved for developers  and  experienced
 * professionals having in-depth computer knowledge. Users are therefore
 * encouraged to load and test the software's suitability as regards their
 * requirements in conditions enabling the security of their systems and/or
 * data to be ensured and,  more generally, to use and operate it in the
 * same conditions as regards security.
 *
 * The fact that you are presently reading this means that you have had
 * knowledge of the CeCILL-C license and that you accept its terms.
 *
 * @author Copyright (c) PadCMS (http://www.padcms.net)
 * @version $DOXY_VERSION
 */

/**
 * Field type model class
 * Each page contains few layers (fields) with a certain type
 * @ingroup AM_Model
 */
class AM_Model_Db_FieldType extends AM_Model_Db_Abstract
{
    const TYPE_BODY           = 'body';
    const TYPE_GALLERY        = 'gallery';
    const TYPE_MINI_ARTICLE   = 'mini_article';
    const TYPE_VIDEO          = 'video';
    const TYPE_BACKGROUND     = 'background';
    const TYPE_SCROLLING_PANE = 'scrolling_pane';
    const TYPE_SLIDE          = 'slide';
    const TYPE_OVERLAY        = 'overlay';
    const TYPE_SOUND          = 'sound';
    const TYPE_HTML           = 'html';
    const TYPE_ADVERT         = 'advert';
    const TYPE_DRAG_AND_DROP  = 'drag_and_drop';
    const TYPE_POPUP          = 'popup';
    const TYPE_HTML5          = 'html5';
    const TYPE_GAMES          = 'games';
    const TYPE_3D             = '3d';
}