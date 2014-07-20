//
//  main.m
//  week1
//
//  Created by sunsidew on 2014. 7. 15..
//  Copyright (c) 2014년 sunsidew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileManager.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        FileManager* MYFm = [[FileManager alloc] init];
        NSString* dirpath = @"/Users/sunsidew";
        
        // #1 구현 및 테스트
        [MYFm NXListAllFilesInDir:dirpath];
        
        // #2(특정 경로의 모든 파일명 받아오는 함수) 구현 및 테스트
        NSArray* fileList = [MYFm NXAllFilesInDir:dirpath];
        for(int i = 0 ; i < [fileList count] ; i++) {
            NSLog(@"%@",fileList[i]);
        }
        
        // #2(특정 경로의 모든 파일명 받아오는 함수) 구현 및 테스트
        NSString* filename = @".bashrc";
        NSString* filename2 = @"nonexistant.file";
        
        if([MYFm isExistFilename:filename atPath:dirpath]) {
            NSLog(@"File exist");
        } else {
            NSLog(@"File is not exist");
        }
        
        if([MYFm isExistFilename:filename2 atPath:dirpath]) {
            NSLog(@"File exist");
        } else {
            NSLog(@"File is not exist");
        }
        
        // ------ 플러스 미션 3개 구현 및 테스트 ------
        
        // 파일명 순서대로 정렬을 하려면?
        fileList = [MYFm NXSortedAllFilesInDir:dirpath];
        for(int i = 0 ; i < [fileList count] ; i++) {
            NSLog(@"%@",fileList[i]);
        }
        
        // 만약 찾아야하는 파일이 여러개라면?
        NSArray* filenames = [NSArray arrayWithObjects:@"Desktop", @"Documents", @"nonexist", nil];
        NSObject* object = [[NSObject alloc] init];
        NSDictionary* fileExistList = [[NSDictionary alloc] init];
        
        fileExistList = [MYFm isExistFiles:filenames atPath:dirpath];
        for (id key in fileExistList) {
            object = [fileExistList objectForKey:key];
            NSLog(@"%@ : %@",key,object);
        }
        
        // 특정 확장자(.txt) 파일 목록만 구하려면?
        fileList = [MYFm NXExtFilesInDir:@"/Users/sunsidew/desktop" whatExt:@"txt"];
        for(int i = 0 ; i < [fileList count] ; i++) {
            NSLog(@"%@",fileList[i]);
        }
        
    }
    return 0;
}