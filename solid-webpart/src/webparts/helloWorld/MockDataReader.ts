import { SPDataReader } from './SPDataReader';
import { ISPLists, ISPList } from './SPContracts';

export class MockDataReader extends SPDataReader {
    constructor() {
        super(null);
    }

    getData(): Promise<ISPLists> {
        return this.get().then((data: ISPList[]) => {
            var listData: ISPLists = { value: data };
            return listData;
        }) as Promise<ISPLists>;
    }

    private static _items: ISPList[] = [
        { Title: 'Mock List 1', Id: '1' },
        { Title: 'Mock List 2', Id: '2' },
        { Title: 'Mock List 3', Id: '3' }];

    private get(): Promise<ISPList[]> {
        return new Promise<ISPList[]>((resolve) => {
            resolve(MockDataReader._items);
        });
    }
}