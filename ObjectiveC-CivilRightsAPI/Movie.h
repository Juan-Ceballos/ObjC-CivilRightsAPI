//
//  Movie.h
//  ObjectiveC-CivilRightsAPI
//
//  Created by Juan Ceballos on 2/25/21.
//

@interface Movie : NSObject

@property NSString *originalTitle;
@property NSString *overview;
@property NSString *posterPath;

// initializer

- (instancetype)initWithDictionary: (NSDictionary *) dict;

@end
