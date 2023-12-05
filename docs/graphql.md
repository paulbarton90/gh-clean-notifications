# GraphQL Notes

This is a file that has the notes for GraphQL queries when it comes to setting
the notifications as done.

## GraphQL Items

This information is gotten via `gh api -H "Accept:
application/vnd.github.v4.idl" graphql -q .data | tee gh-graph.log; echo ""`.
This enables us to go through the output without having to re-query the API.

### Query

This covers what we need for the `notificationThreads` query.

```idl
  """
  A list of notification threads for the viewer. Returns an empty list for a user other than
  the current viewer.

  Combining both filterBy and query arguments will result in an error.
  Please favor using the query argument.
  """
  notificationThreads(
    """
    Returns the elements in the list that come after the specified cursor.
    """
    after: String

    """
    Returns the elements in the list that come before the specified cursor.
    """
    before: String

    """
    Filtering options for notifications. Will soon be deprecated.
    """
    filterBy: NotificationThreadFilters

    """
    Returns the first _n_ elements from the list.
    """
    first: Int

    """
    Returns the last _n_ elements from the list.
    """
    last: Int

    """
    The search string to look for. If no is:read, is:unread, or is:done
    qualifiers are included in the query, results will include read and unread
    notification threads by default.
    """
    query: String
  ): NotificationThreadConnection!

"""
The reason you received a notification about a subject.
"""
enum NotificationReason {
  """
  You were requested for review for deployment.
  """
  APPROVAL_REQUESTED

  """
  You were assigned to the Issue/PR.
  """
  ASSIGN

  """
  You created the thread.
  """
  AUTHOR

  """
  You are subscribed to continuous integration activity.
  """
  CI_ACTIVITY

  """
  You commented on the thread.
  """
  COMMENT

  """
  You accepted an invitation to contribute to the repository.
  """
  INVITATION

  """
  You subscribed to the thread (via an Issue or Pull Request).
  """
  MANUAL

  """
  New requests from members.
  """
  MEMBER_FEATURE_REQUESTED

  """
  You were specifically @mentioned in the content.
  """
  MENTION

  """
  A pull request you're subscribed to was marked ready for review.
  """
  READY_FOR_REVIEW

  """
  You were requested for review.
  """
  REVIEW_REQUESTED

  """
  You saved this notification
  """
  SAVED

  """
  You were given credit for contributing to a Security Advisory.
  """
  SECURITY_ADVISORY_CREDIT

  """
  You have access to the notification subject's Dependabot alerts.
  """
  SECURITY_ALERT

  """
  You changed the thread state (for example, closing an Issue or merging a Pull Request).
  """
  STATE_CHANGE

  """
  You are watching the subject of the notification.
  """
  SUBSCRIBED

  """
  You were on a team that was mentioned.
  """
  TEAM_MENTION
}

"""
The possible values for the notification restriction setting.
"""
enum NotificationRestrictionSettingValue {
  """
  The setting is disabled for the owner.
  """
  DISABLED

  """
  The setting is enabled for the owner.
  """
  ENABLED
}

"""
The possible states of a notification.
"""
enum NotificationStatus {
  """
  A notification is archived
  """
  ARCHIVED

  """
  A notification is done
  """
  DONE

  """
  A notification is read
  """
  READ

  """
  A notification is unread
  """
  UNREAD
}

"""
Represents a notification thread for the viewer.
"""
type NotificationThread implements Node {
  """
  The Node ID of this object
  """
  id: ID!

  """
  Archived state of the notification.
  """
  isArchived: Boolean!

  """
  Done state of the notification.
  """
  isDone: Boolean!

  """
  Whether a notification has been saved
  """
  isSaved: Boolean!

  """
  Whether a notification has been starred
  """
  isStarred: Boolean!

  """
  Unread state of the notification.
  """
  isUnread: Boolean!

  """
  The last time that notifications were read for this thread.
  """
  lastReadAt: DateTime

  """
  The last time that notifications were updated for this thread.
  """
  lastSummarizedAt: DateTime!

  """
  The last time that a notification was received on this thread for the current user
  """
  lastUpdatedAt: DateTime!

  """
  The notification's list.
  """
  list: NotificationsList!

  """
  The notification's list id
  """
  listId: String!

  """
  The notification's list type
  """
  listType: String!

  """
  The oldest unread author internal anchor
  """
  oldestUnreadItemAnchor: String

  """
  The reason a notification was received.
  """
  reason: NotificationReason

  """
  The last 3 recent participants.
  """
  recentParticipants: [User!]!

  """
  The notification's subject.
  """
  subject: NotificationsSubject!

  """
  Subscription status for the thread
  """
  subscriptionStatus: NotificationThreadSubscriptionState!

  """
  The notification's rollup summary id
  """
  summaryId: String!

  """
  The author of the item being used to summarize the thread.
  """
  summaryItemAuthor: User

  """
  The body text of the item being used to summarize the thread.
  """
  summaryItemBody: String

  """
  The notification's thread id
  """
  threadId: String!

  """
  The notification's thread type
  """
  threadType: String!

  """
  The notification's title
  """
  title: String!

  """
  The number of unread items.
  """
  unreadItemsCount: Int!

  """
  The HTTP URL for the notification thread's subject
  """
  url: URI!
}

"""
A list of notification threads.
"""
type NotificationThreadConnection {
  """
  A list of edges.
  """
  edges: [NotificationThreadEdge]

  """
  A list of nodes.
  """
  nodes: [NotificationThread]

  """
  Information to aid in pagination.
  """
  pageInfo: PageInfo!

  """
  Identifies the total count of items in the connection.
  """
  totalCount: Int!
}

"""
An edge in a connection.
"""
type NotificationThreadEdge {
  """
  A cursor for use in pagination.
  """
  cursor: String!

  """
  The item at the end of the edge.
  """
  node: NotificationThread
}

"""
Ways in which to filter lists of notification threads.
"""
input NotificationThreadFilters {
  """
  Only return notification threads where the list is in the given list
  """
  listIds: [ID!]

  """
  Only return notification threads where the reason is in the list
  """
  reasons: [NotificationReason!]

  """
  Only return saved notifications. All other filters will be ignored.
  """
  savedOnly: Boolean = false

  """
  Only return starred notifications. All other filters will be ignored.
  """
  starredOnly: Boolean = false

  """
  Only return notifications where the status is in the list.
  """
  statuses: [NotificationStatus!]

  """
  Only return matching thread types
  """
  threadTypes: [String!]
}

"""
The possible subscription states of a notification thread.
"""
enum NotificationThreadSubscriptionState {
  """
  The thread's list is ignored.
  """
  LIST_IGNORED

  """
  The thread's list is subscribed to.
  """
  LIST_SUBSCRIBED

  """
  The thread is subscribed to.
  """
  THREAD_SUBSCRIBED

  """
  The thread's type is subscribed to.
  """
  THREAD_TYPE_SUBSCRIBED

  """
  The thread is not subscribed to.
  """
  UNSUBSCRIBED
}

"""
The parent object that the notification thread's subject belongs to.
"""
union NotificationsList = Organization | Repository | Team | User

"""
The notification's subject.
"""
union NotificationsSubject = CheckSuite | Commit | Discussion | Gist | Issue | MemberFeatureRequestNotification | PullRequest | Release | RepositoryDependabotAlertsThread | RepositoryInvitation | RepositoryVulnerabilityAlert | SecurityAdvisory | TeamDiscussion | WorkflowRun

```

### Mutation

Below are the GraphQL items for the mutation `markNotificationsAsDone`. We only
use the markNotificationsAsDone as it allows us to send a single ID versus
multiple without the different paths.

```idl
"""
Marks a notification as done
"""
markNotificationsAsDone(
  """
  Parameters for MarkNotificationsAsDone
  """
  input: MarkNotificationsAsDoneInput!
): MarkNotificationsAsDonePayload

"""
Autogenerated input type of MarkNotificationsAsDone
"""
input MarkNotificationsAsDoneInput {
  """
  A unique identifier for the client performing the mutation.
  """
  clientMutationId: String

  """
  The NotificationThread IDs that will be marked as done.
  """
  ids: [ID!]!
}

"""
Autogenerated return type of MarkNotificationsAsDone
"""
type MarkNotificationsAsDonePayload {
  """
  A unique identifier for the client performing the mutation.
  """
  clientMutationId: String

  """
  Did the operation succeed?
  """
  success: Boolean
}
```

## Sources

* https://github.com/orgs/community/discussions/39606
  * Shows `notificationThreads` query and `markNotificationAsDone` mutation.
* https://docs.github.com/en/graphql/guides/introduction-to-graphql#discovering-the-graphql-api
  * Guides you on how to do introspection on the API itself.
* https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps
  * Definition of the scopes for the API.
