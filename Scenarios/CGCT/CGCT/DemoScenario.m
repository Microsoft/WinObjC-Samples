//******************************************************************************
//
// Copyright (c) Microsoft. All rights reserved.
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

#import "DemoScenario.h"

@implementation DemoScenario
- (NSString *)name {
  [NSException raise:NSInvalidArgumentException
              format:@"Scenario %@ must override -name", self];
  return nil;
}

- (UIColor *)backgroundColor {
  [NSException raise:NSInvalidArgumentException
              format:@"Scenario %@ must override -backgroundColor", self];
  return nil;
}

- (void)drawDemoIntoContext:(CGContextRef)context withFrame:(CGRect)bounds {
}
@end
