//
//  FileManager.m
//  week1
//
//  Created by sunsidew on 2014. 7. 15..
//  Copyright (c) 2014년 sunsidew. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager {
    NSFileManager * fileManager;
}

- (id)init
{
    self = [super init];
    if (self) {
        fileManager = [NSFileManager defaultManager];
    }
    return self;
//    return [super init];
}

- (void) NXListAllFilesInDir:(NSString *)path {
    NSArray * fileList = [self NXAllFilesInDir:path];
    NSUInteger count = [fileList count];
    
    for(int i = 0 ; i < count ; i++) {
        NSLog(@"%@", [fileList objectAtIndex:i]);
    }
}

- (NSArray *) NXSortedAllFilesInDir:(NSString *)path {
    NSArray* fileList = [self NXAllFilesInDir:path];
    return [fileList sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *) NXAllFilesInDir:(NSString *)path {
    return [fileManager contentsOfDirectoryAtPath:path error:NULL];
}

- (NSArray *) NXExtFilesInDir:(NSString *)path whatExt:(NSString *)ext {
    NSArray* fileList = [self NXAllFilesInDir:path];
    NSMutableArray* extfileList = [[NSMutableArray alloc] init];
    NSUInteger extIdx;
    
    for(int i = 0 ; i < fileList.count ; i++) {
        extIdx = [fileList[i] rangeOfString:@"." options:NSBackwardsSearch].location;
        
        if ((int) extIdx >= 0 ) {
            if([[fileList[i] substringFromIndex:extIdx+1] isEqualToString:ext]) {
                [extfileList addObject:fileList[i]];
            }
        }
    }
    
    return (NSArray *)extfileList;
}

- (BOOL) isExistFilename:(NSString*)filename atPath:(NSString*)path {
    NSArray* fileList = [self NXAllFilesInDir:path];
    for(int i = 0 ; i < fileList.count ; i++) {
        if([fileList[i] isEqualToString:filename]) {
            return true;
        }
    }
    return false;
}

- (NSDictionary*) isExistFiles:(NSArray*)filenames atPath:(NSString*)path {
    NSArray* fileList = [self NXAllFilesInDir:path];
    NSMutableDictionary* fileExistList = [[NSMutableDictionary alloc] init];
    BOOL flag;
    
    for(int i = 0 ; i < filenames.count ; i++) {
        flag = false;
        for(int j = 0 ; j < fileList.count ; j++) {
            if([fileList[j] isEqualToString:filenames[i]]) {
                flag = true;
                break;
            }
        }
        [fileExistList setObject:[NSNumber numberWithBool:flag] forKey:filenames[i]];
    }
    
    return fileExistList;
}

@end