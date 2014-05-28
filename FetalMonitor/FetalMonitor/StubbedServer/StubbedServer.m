//
//  StubbedServer.m
//  FetalMonitor
//
//  Created by Tapas Behera on 5/27/14.
//  Copyright (c) 2014 AirStrip. All rights reserved.
//

#import "StubbedServer.h"

@implementation StubbedServer


-(void)executeService:(int)serviceCode withDelegate:(id)delegate
{
    NSString *jsonString = [self getResponse:serviceCode];
    if(jsonString!=nil){
        if([delegate respondsToSelector:@selector(succeedWithJson:)]){
            [delegate succeedWithJson:jsonString];
        }
    }else{
        if([delegate respondsToSelector:@selector(failedWithError:)]){
            [delegate failedWithError:@"Sorry , server failed to respond !"];
        }
    }
}

-(NSString *)getResponse:(int)serviceCode
{
    NSString *response = nil;
    if(serviceCode==1){
        response = [NSString stringWithFormat:@"%s","[{\"first_name\":\"Louise\",\"last_name\":\"Little\",\"age\":28},{\"first_name\":\"Henry\",\"last_name\":\"Fisher\",\"age\":26},{\"first_name\":\"Anne\",\"last_name\":\"Gonzalez\",\"age\":20},{\"first_name\":\"Billy\",\"last_name\":\"Harrison\",\"age\":28},{\"first_name\":\"Diane\",\"last_name\":\"Reynolds\",\"age\":20},{\"first_name\":\"Lillian\",\"last_name\":\"Phillips\",\"age\":28},{\"first_name\":\"Rachel\",\"last_name\":\"Edwards\",\"age\":32},{\"first_name\":\"Nicholas\",\"last_name\":\"Romero\",\"age\":40},{\"first_name\":\"George\",\"last_name\":\"Montgomery\",\"age\":24},{\"first_name\":\"Kathleen\",\"last_name\":\"Cook\",\"age\":29},{\"first_name\":\"Dorothy\",\"last_name\":\"Hall\",\"age\":29},{\"first_name\":\"Christine\",\"last_name\":\"Barnes\",\"age\":28},{\"first_name\":\"George\",\"last_name\":\"Stevens\",\"age\":39},{\"first_name\":\"Terry\",\"last_name\":\"Bradley\",\"age\":33},{\"first_name\":\"Jonathan\",\"last_name\":\"Hudson\",\"age\":27},{\"first_name\":\"Stephanie\",\"last_name\":\"Burton\",\"age\":30},{\"first_name\":\"Jason\",\"last_name\":\"Carr\",\"age\":29},{\"first_name\":\"Diane\",\"last_name\":\"Hamilton\",\"age\":29},{\"first_name\":\"Judith\",\"last_name\":\"Carter\",\"age\":32},{\"first_name\":\"Karen\",\"last_name\":\"Wright\",\"age\":28},{\"first_name\":\"Sandra\",\"last_name\":\"Palmer\",\"age\":31},{\"first_name\":\"Jack\",\"last_name\":\"Anderson\",\"age\":34},{\"first_name\":\"Laura\",\"last_name\":\"Dunn\",\"age\":30},{\"first_name\":\"Rachel\",\"last_name\":\"Bennett\",\"age\":29},{\"first_name\":\"Betty\",\"last_name\":\"Lewis\",\"age\":23},{\"first_name\":\"Arthur\",\"last_name\":\"Larson\",\"age\":37},{\"first_name\":\"Nancy\",\"last_name\":\"Bell\",\"age\":37},{\"first_name\":\"Martin\",\"last_name\":\"Carroll\",\"age\":20},{\"first_name\":\"Jacqueline\",\"last_name\":\"Reyes\",\"age\":28},{\"first_name\":\"Mildred\",\"last_name\":\"Gutierrez\",\"age\":39},{\"first_name\":\"Jack\",\"last_name\":\"Hudson\",\"age\":25},{\"first_name\":\"Teresa\",\"last_name\":\"Franklin\",\"age\":40},{\"first_name\":\"Frances\",\"last_name\":\"Hudson\",\"age\":23},{\"first_name\":\"Martin\",\"last_name\":\"Lawrence\",\"age\":36},{\"first_name\":\"Scott\",\"last_name\":\"Mason\",\"age\":30},{\"first_name\":\"Bobby\",\"last_name\":\"Lawrence\",\"age\":26},{\"first_name\":\"Rose\",\"last_name\":\"Carroll\",\"age\":34},{\"first_name\":\"Lori\",\"last_name\":\"Hunter\",\"age\":32},{\"first_name\":\"Earl\",\"last_name\":\"Wells\",\"age\":35},{\"first_name\":\"Joshua\",\"last_name\":\"Mitchell\",\"age\":24},{\"first_name\":\"Linda\",\"last_name\":\"Lawrence\",\"age\":33},{\"first_name\":\"Annie\",\"last_name\":\"Watson\",\"age\":24},{\"first_name\":\"Rose\",\"last_name\":\"Flores\",\"age\":32},{\"first_name\":\"Clarence\",\"last_name\":\"Thomas\",\"age\":38},{\"first_name\":\"Rose\",\"last_name\":\"Hicks\",\"age\":39},{\"first_name\":\"Norma\",\"last_name\":\"Day\",\"age\":35},{\"first_name\":\"Stephanie\",\"last_name\":\"Parker\",\"age\":25},{\"first_name\":\"Kenneth\",\"last_name\":\"Castillo\",\"age\":33},{\"first_name\":\"Antonio\",\"last_name\":\"Brown\",\"age\":26},{\"first_name\":\"Bobby\",\"last_name\":\"Burton\",\"age\":33},{\"first_name\":\"Christine\",\"last_name\":\"Greene\",\"age\":32},{\"first_name\":\"George\",\"last_name\":\"Reed\",\"age\":27},{\"first_name\":\"Albert\",\"last_name\":\"Kim\",\"age\":28},{\"first_name\":\"Russell\",\"last_name\":\"Garza\",\"age\":28},{\"first_name\":\"William\",\"last_name\":\"Stevens\",\"age\":32},{\"first_name\":\"Patricia\",\"last_name\":\"Owens\",\"age\":39},{\"first_name\":\"Beverly\",\"last_name\":\"Cooper\",\"age\":35},{\"first_name\":\"Philip\",\"last_name\":\"Ortiz\",\"age\":32},{\"first_name\":\"Adam\",\"last_name\":\"Daniels\",\"age\":36},{\"first_name\":\"Juan\",\"last_name\":\"Jackson\",\"age\":37},{\"first_name\":\"Eugene\",\"last_name\":\"Ellis\",\"age\":29},{\"first_name\":\"Arthur\",\"last_name\":\"Jordan\",\"age\":24},{\"first_name\":\"Russell\",\"last_name\":\"Gordon\",\"age\":25},{\"first_name\":\"Louis\",\"last_name\":\"Flores\",\"age\":29},{\"first_name\":\"Louis\",\"last_name\":\"Dixon\",\"age\":37},{\"first_name\":\"Martin\",\"last_name\":\"Fields\",\"age\":37},{\"first_name\":\"Christine\",\"last_name\":\"Sanders\",\"age\":39},{\"first_name\":\"Carl\",\"last_name\":\"Hudson\",\"age\":38},{\"first_name\":\"Phyllis\",\"last_name\":\"Mccoy\",\"age\":26},{\"first_name\":\"Robin\",\"last_name\":\"Shaw\",\"age\":24},{\"first_name\":\"Alice\",\"last_name\":\"Washington\",\"age\":25},{\"first_name\":\"Ralph\",\"last_name\":\"Lawson\",\"age\":22},{\"first_name\":\"Andrew\",\"last_name\":\"Russell\",\"age\":34},{\"first_name\":\"Larry\",\"last_name\":\"Diaz\",\"age\":23},{\"first_name\":\"Marilyn\",\"last_name\":\"Marshall\",\"age\":39},{\"first_name\":\"Louis\",\"last_name\":\"Jenkins\",\"age\":35},{\"first_name\":\"Todd\",\"last_name\":\"Boyd\",\"age\":25},{\"first_name\":\"Jose\",\"last_name\":\"Gomez\",\"age\":39},{\"first_name\":\"Ernest\",\"last_name\":\"Stevens\",\"age\":30},{\"first_name\":\"Justin\",\"last_name\":\"Flores\",\"age\":20},{\"first_name\":\"Juan\",\"last_name\":\"Medina\",\"age\":31},{\"first_name\":\"Melissa\",\"last_name\":\"Kim\",\"age\":26},{\"first_name\":\"Annie\",\"last_name\":\"Evans\",\"age\":25},{\"first_name\":\"Louis\",\"last_name\":\"Fowler\",\"age\":35},{\"first_name\":\"Martha\",\"last_name\":\"Cunningham\",\"age\":34},{\"first_name\":\"Robert\",\"last_name\":\"Marshall\",\"age\":29},{\"first_name\":\"Teresa\",\"last_name\":\"Ward\",\"age\":33},{\"first_name\":\"Gloria\",\"last_name\":\"Sanchez\",\"age\":39},{\"first_name\":\"Antonio\",\"last_name\":\"Collins\",\"age\":38},{\"first_name\":\"Walter\",\"last_name\":\"Rice\",\"age\":37},{\"first_name\":\"Sean\",\"last_name\":\"Grant\",\"age\":24},{\"first_name\":\"Lawrence\",\"last_name\":\"Bryant\",\"age\":25},{\"first_name\":\"Juan\",\"last_name\":\"Wheeler\",\"age\":23},{\"first_name\":\"Mark\",\"last_name\":\"Nelson\",\"age\":21},{\"first_name\":\"Cynthia\",\"last_name\":\"Fernandez\",\"age\":26},{\"first_name\":\"Michelle\",\"last_name\":\"Johnston\",\"age\":31}]" ];
    }else if(serviceCode==2){
        response = [NSString stringWithFormat:@"%s","[{\"monitor_data\":\"AirStripIOSTestImage1.gif\"}]"];
        
    }
    return response;
}




@end
