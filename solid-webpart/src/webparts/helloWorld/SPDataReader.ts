import { IWebPartContext } from '@microsoft/sp-webpart-base';

import {
    SPHttpClient,
    SPHttpClientResponse   
} from '@microsoft/sp-http';

import { IDataReader } from './DataReader';
import { ISPLists } from './SPContracts';

export class SPDataReader implements IDataReader {
    constructor(context: IWebPartContext) {
        this._context = context;
    }

    getData(): Promise<ISPLists> {
        return this._context.spHttpClient
            .get(
                this._context.pageContext.web.absoluteUrl + + `/_api/web/lists?$filter=Hidden eq false`,
                SPHttpClient.configurations.v1)
            .then((response: SPHttpClientResponse) => {
                return response.json();
            });
    }

    private _context: IWebPartContext;
}
