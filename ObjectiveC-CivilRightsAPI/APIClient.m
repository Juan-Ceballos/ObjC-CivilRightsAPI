//
//  APIClient.m
//  ObjectiveC-CivilRightsAPI
//
//  Created by Juan Ceballos on 2/25/21.
//

#import <Foundation/Foundation.h>
#import "APIClient.h"
#import "Movie.h"

@implementation APIClient

- (void)fetchCivilRightsMovies:(void (^)(NSError *, NSArray *))completion {
 // https://civilrights-media-default-rtdb.firebaseio.com/.json
    
    // endpoint
    NSString *endPoint = @"https://civilrights-media-default-rtdb.firebaseio.com/.json";
    
    // create url
    NSURL *url = [NSURL URLWithString:endPoint];
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(error, nil);
        }
        
        else {
            // declare and error type to capture
            // the reference of any errors
            NSError *error;
            
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            NSMutableArray *movies = [[NSMutableArray alloc] init];
            
            NSDictionary *moviesDict = jsonDict[@"movies"];
            
            for (NSString *movieId in moviesDict) {
                //NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
                NSDictionary *movieDict = moviesDict[movieId];
                Movie *movie = [[Movie alloc] initWithDictionary:movieDict];
                
                [movies addObject:movie];
            }
            
            // capture movies in completion
            // dispatch back to the main thread
            dispatch_async(dispatch_get_main_queue(), ^ {
                completion(nil, movies);
            });
            
        }
        
    }];
    
    // resume execution of network request
    [dataTask resume];
    
}

@end
