//
//  APIClient.h
//  ObjectiveC-CivilRightsAPI
//
//  Created by Juan Ceballos on 2/25/21.
//

@interface APIClient : NSObject

// methods

- (void) fetchCivilRightsMovies: (void (^) (NSError *, NSArray *)) completion;



@end
