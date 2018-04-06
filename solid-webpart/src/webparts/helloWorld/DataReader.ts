import {
    Version,
    Environment,
    EnvironmentType
} from '@microsoft/sp-core-library';
import { IWebPartContext } from '@microsoft/sp-webpart-base';

import { ISPLists } from './SPContracts';
import { SPDataReader } from './SPDataReader';
import { MockDataReader } from './MockDataReader';

export interface IDataReader {
    getData(): Promise<ISPLists>;
}

export class DataReaderFactory {
    public static getReader(context: IWebPartContext) {
        if (Environment.type === EnvironmentType.SharePoint || Environment.type === EnvironmentType.ClassicSharePoint) {
            return new SPDataReader(context);
        }
        else if (Environment.type === EnvironmentType.Local) {
            return new MockDataReader();
        }
    }
}