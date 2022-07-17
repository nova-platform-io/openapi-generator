/* tslint:disable */
/* eslint-disable */
/**
 * OpenAPI Petstore
 * This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

import { exists, mapValues } from '../runtime';
import type { BehaviorType } from './BehaviorType';
import {
    BehaviorTypeFromJSON,
    BehaviorTypeFromJSONTyped,
    BehaviorTypeToJSON,
} from './BehaviorType';
import type { ResponseMeta } from './ResponseMeta';
import {
    ResponseMetaFromJSON,
    ResponseMetaFromJSONTyped,
    ResponseMetaToJSON,
} from './ResponseMeta';

/**
 * 
 * @export
 * @interface GetBehaviorTypeResponse
 */
export interface GetBehaviorTypeResponse {
    /**
     * 
     * @type {ResponseMeta}
     * @memberof GetBehaviorTypeResponse
     */
    meta: ResponseMeta;
    /**
     * 
     * @type {BehaviorType}
     * @memberof GetBehaviorTypeResponse
     */
    data?: BehaviorType;
}

/**
 * Check if a given object implements the GetBehaviorTypeResponse interface.
 */
export function instanceOfGetBehaviorTypeResponse(value: object): boolean {
    let isInstance = true;
    isInstance = isInstance && "meta" in value;

    return isInstance;
}

export function GetBehaviorTypeResponseFromJSON(json: any): GetBehaviorTypeResponse {
    return GetBehaviorTypeResponseFromJSONTyped(json, false);
}

export function GetBehaviorTypeResponseFromJSONTyped(json: any, ignoreDiscriminator: boolean): GetBehaviorTypeResponse {
    if ((json === undefined) || (json === null)) {
        return json;
    }
    return {
        
        'meta': ResponseMetaFromJSON(json['meta']),
        'data': !exists(json, 'data') ? undefined : BehaviorTypeFromJSON(json['data']),
    };
}

export function GetBehaviorTypeResponseToJSON(value?: GetBehaviorTypeResponse | null): any {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    return {
        
        'meta': ResponseMetaToJSON(value.meta),
        'data': BehaviorTypeToJSON(value.data),
    };
}
