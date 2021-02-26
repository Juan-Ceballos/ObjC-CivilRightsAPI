//
//  Movie.m
//  ObjectiveC-CivilRightsAPI
//
//  Created by Juan Ceballos on 2/25/21.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@implementation Movie

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.originalTitle = dict[@"originalTitle"];
        self.overview = dict[@"overview"];
        self.posterPath = dict[@"posterPath"];
    }
    
    return self;
}

@end
