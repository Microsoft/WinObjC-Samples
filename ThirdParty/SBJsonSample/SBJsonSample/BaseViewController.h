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

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>

@property NSArray* buttonArray;
@property UITableView* APITestTableView;
@property NSMutableAttributedString* bufferedOutText;
@property UITextView* delegateOutputTextView;

-(void)appendToPrintBuffer:(id)format, ...;
-(void)clearLogFromTextView;
-(void)printColoredDebugInfo:(NSString*) string using:(UIColor*)color ;
-(NSString*)readJsonFrom:(NSString*)file withExtension:(NSString*)extension;
-(void)printAndscrollDelegateTextViewToBottom;
-(void)constructViewWithTableView;

@end
