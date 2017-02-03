//
//  Global.h
//  AFNetworkingTutorial
//
//  Created by Wuqian on 1/25/17.
//  Copyright © 2017 Blog. All rights reserved.
//

#ifndef Global_h
#define Global_h

#define TBWLOG( s, ... ) NSLog( @"%s: %@ l=>%d", __FUNCTION__, [NSString stringWithFormat:(s), ##__VA_ARGS__], __LINE__ )

#define TBWURL_BASEURL                                              @"http://www.hualongtech.com/toptal/blog/2017-01-24"

#define SUCCESS_WITH_NO_ERROR                       200
#define SUCCESS_WITH_CREATE                         201

#define ERROR_BAD_REQUEST                           400
#define ERROR_UNAUTHORIZED                          401
#define ERROR_FORBIDDEN                             403
#define ERROR_NOT_FOUND                             404
#define ERROR_VERSION_EXPIRED                       412
#define ERROR_USER_NEWDEVICE                        419
#define ERROR_USER_DISABLED                         420
#define ERROR_REQUEST_FLOOD                         429
#define ERROR_USER_INVALID_PHONECARRIER             461
#define ERROR_USER_INVALID_PHONENUMBER              462
#define ERROR_CONNECTION_FAILED                     499
#define ERROR_INTERNAL_SERVER_ERROR                 500
#define ERROR_UNKNOWN                               520
#define ERROR_MAINTENANCE_MODE                      555

#define TBWLOCALNOTIFICATION_MOUNTAIN_LIST_UPDATED                  @"TBWLOCALNOTIFICATION_MOUNTAIN_LIST_UPDATED"
#define TBWLOCALNOTIFICATION_MOUNTAIN_LIST_FAILED                   @"TBWLOCALNOTIFICATION_MOUNTAIN_LIST_FAILED"

#endif /* Global_h */
