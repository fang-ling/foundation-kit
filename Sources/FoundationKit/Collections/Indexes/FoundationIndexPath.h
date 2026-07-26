/*
 *  FoundationIndexPath.h
 *  foundation-kit
 *
 *  Created by Fang Ling on 2026/7/18.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and limitations under the License.
 */

#import <CKit/CKit.h>
#import <ObjectiveCKit/ObjectiveCKit.h>

C_ASSUME_NONNULL_BEGIN

/**
 * A list of indexes that together represent the path to a specific location in a tree of nested arrays.
 *
 * Each index in an index path represents the index into an array of children from one node in the tree to another, deeper, node.
 *
 * > Note: The UIKit framework adds programming interfaces to the ``FoundationIndexPath`` class of the FoundationKit framework.
 *   The API consists of class factory methods and properties for accessing the various indexed values.
 *   You use the factory methods to create an index path for the corresponding table view or collection view.
 *
 * ## Topics
 *
 * ### Creating and Initializing Index Paths
 *
 * - ``makeIndexPathWithIndexes:count:``
 *
 * ### Working with Indexes
 *
 * - ``indexAtPosition:``
 */
@interface FoundationIndexPath: ObjectiveCObject

/**
 * Creates an index path with one or more nodes.
 *
 * - Parameters:
 *   - indexes: Array of indexes to make up the index path.
 *   - count: Number of nodes to include in the index path.
 *
 * - Returns: Index path with indexes up to length.
 */
+ (instancetype)makeIndexPathWithIndexes:(const CInteger[nonnil])indexes count:(CInteger)count;

/**
 * Provides the value at a particular node in the index path.
 *
 * - Parameter position: Index value of the desired node. Node numbering starts at zero.
 *
 * - Returns: The index value at node or ``FoundationNotFound`` if the node is outside the range of the index path.
 */
- (CInteger)indexAtPosition:(CInteger)position;

@end

C_ASSUME_NONNULL_END
