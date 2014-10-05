//
//  IFLKit - Objective-C wrapper to the Interfacelift.com API
//  Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLLens : IFLModel
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSString* brand;
@property(strong,nonatomic) NSString* model;
@property(strong,nonatomic) NSString* mount;
@property(strong,nonatomic) NSString* max_format_size;
@property(strong,nonatomic) NSNumber* focal_length;
@property(strong,nonatomic) NSNumber* focal_length_tele;
@property(strong,nonatomic) NSNumber* max_aperture;
@property(strong,nonatomic) NSNumber* max_aperture_tele;
@property(strong,nonatomic) NSNumber* max_magnification;
@property(strong,nonatomic) NSNumber* min_focus;
@property(strong,nonatomic) NSNumber* filter_thread;
@property(strong,nonatomic) NSString* reach;
@property(strong,nonatomic) NSString* date_introduced;
@property(strong,nonatomic) NSString* url_amazon;
@end
