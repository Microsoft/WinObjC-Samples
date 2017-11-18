//******************************************************************************
//
// Copyright (c) 2017 Microsoft Corporation. All rights reserved.
//
// This code is licensed under the MIT License (MIT).
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//******************************************************************************

#import "NSStringSerializeViewController.h"
#import "JSONKit.h"

@interface NSStringSerializeViewController () {
    NSString* testString;
}

@end

@implementation NSStringSerializeViewController

-(void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    switch (indexPath.row) {
        case 0: {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                [weakSelf serializeToJSONData];
            });
            break;
        }
        case 1: {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                [weakSelf serializeToJSONDataWithOptions];
            });
            break;
        }
        case 2: {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                [weakSelf serializeToJSONString];
            });
            break;
        }
        case 3: {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                [weakSelf serializeToJSONStringWithOptions];
            });
            break;
        }
        default:
            break;
    }
}

- (void)viewDidLoad {
    testString = [[NSString alloc] initWithFormat:@"test string for testing serialization. "".,,''?/;[]=+(.ailsrgh)12387"];
    [super viewDidLoad];
    self.buttonArray = [[NSArray alloc] initWithObjects:@"convert to JSONData",@"convert to JSONDataWithOptions",@"convert to JSONString",@"convert to JSONStringWithOptions",nil];
    [self constructViewWithTableView];
    [self setTitle:@"NSString Serializer"];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)serializeToJSONData{
    NSData* data = [testString JSONData];
    NSMutableAttributedString* outString = [[NSMutableAttributedString alloc] init];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"created json data from test string."]]];
    [outString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, [outString length])];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" \n%@",data]]];
    [self appendToPrintBuffer:outString];
    [self printAndscrollDelegateTextViewToBottom];
}

-(void)serializeToJSONDataWithOptions{
    NSData* data = [testString JSONDataWithOptions:JKSerializeOptionPretty includeQuotes:YES error:nil];
    NSMutableAttributedString* outString = [[NSMutableAttributedString alloc] init];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"created json data with pretty JSON and included quotes in JSON from test string."]]];
    [outString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, [outString length])];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" \n%@",data]]];
    [self appendToPrintBuffer:outString];
    [self printAndscrollDelegateTextViewToBottom];
}

-(void)serializeToJSONString{
    NSString* jsonString = [testString JSONString];
    NSMutableAttributedString* outString = [[NSMutableAttributedString alloc] init];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"created json String from test string. "]]];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@",testString]]];
    [outString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, [outString length])];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n Output is : \n%@",jsonString]]];
    [self appendToPrintBuffer:outString];
    [self printAndscrollDelegateTextViewToBottom];
}

-(void)serializeToJSONStringWithOptions{
    NSString* jsonString = [testString JSONStringWithOptions:JKSerializeOptionEscapeForwardSlashes includeQuotes:YES error:nil];
    NSMutableAttributedString* outString = [[NSMutableAttributedString alloc] init];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"created json data with escaped forward slashes and included quotes in JSON from test string."]]];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@",testString]]];
    [outString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, [outString length])];
    [outString appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n Output is : \n%@",jsonString]]];
    [self appendToPrintBuffer:outString];
    [self printAndscrollDelegateTextViewToBottom];
}

@end
