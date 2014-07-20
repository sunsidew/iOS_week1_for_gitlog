//
//  FileManager.h
//  week1
//
//  Created by sunsidew on 2014. 7. 15..
//  Copyright (c) 2014년 sunsidew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject

-(void) NXListAllFilesInDir:(NSString*)path;
-(NSArray*) NXAllFilesInDir:(NSString*)path;
-(BOOL) isExistFilename:(NSString*)filename atPath:(NSString*)path;

-(NSArray*) NXSortedAllFilesInDir:(NSString *)path;
-(NSArray*) NXExtFilesInDir:(NSString *)path whatExt:(NSString *)ext;
-(NSDictionary*) isExistFiles:(NSArray*)filenames atPath:(NSString*)path;

@end
