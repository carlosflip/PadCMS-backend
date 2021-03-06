<?php
/**
 * @file
 * AM_Api_Apns class definition.
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
 * This class is responsible for saving device token for apple push notification service
 * @ingroup AM_Api
 */
class AM_Api_Apns extends AM_Api
{
    const RESULT_SUCCESS       = 1;
    const RESULT_RECORD_EXISTS = 2;

    /**
     * Saves device token, which will use to send notifications
     *
     * @param string $sUdid
     * @param int $iApplicationId
     * @param string $sToken
     * @return void
     * @throws AM_Api_Apns_Exception
     */
    public function setDeviceToken($sUdid, $iApplicationId, $sToken)
    {
        $sUdid          = trim($sUdid);
        $iApplicationId = intval($iApplicationId);
        $sToken         = trim($sToken);

        if (empty($sUdid)) {
            throw new AM_Api_Apns_Exception(sprintf('Invalid UDID given: "%s"', $sUdid));
        }

        if (empty($sToken)) {
            throw new AM_Api_Apns_Exception(sprintf('Invalid token given: "%s"', $sToken));
        }

        $oDeviceToken = AM_Model_Db_Table_Abstract::factory('device_token')
                ->findOneBy(array('udid'           => $sUdid,
                                  'token'          => $sToken,
                                  'application_id' => $iApplicationId));

        if (!is_null($oDeviceToken)) {
            $oDeviceToken->token = $sToken;
            $oDeviceToken->save();
            return array('code' => self::RESULT_RECORD_EXISTS);
        }

        $oDeviceToken                 = new AM_Model_Db_DeviceToken();
        $oDeviceToken->udid           = $sUdid;
        $oDeviceToken->token          = $sToken;
        $oDeviceToken->application_id = $iApplicationId;
        $oDeviceToken->save();

        return array('code' => self::RESULT_SUCCESS);
    }
}
