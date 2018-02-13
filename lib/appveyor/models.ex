defmodule Role do
  defstruct(
    created: nil,
    isSystem: nil,
    name: nil,
    roleId: nil,
    groups: nil
  )
end

defmodule Group do
  defstruct(
    name: nil,
    permissions: nil
  )
end

defmodule Project do
  defstruct(
    projectId: nil,
    accountId: nil,
    accountName: nil,
    builds: nil,
    name: nil,
    slug: nil,
    repositoryType: nil,
    repositoryScm: nil,
    repositoryName: nil,
    repositoryBranch: nil,
    isPrivate: nil,
    skipBranchesWithoutAppveyorYml: nil,
    nuGetFeed: nil,
    created: nil
  )
end

defmodule User do
  defstruct(
    accountId: nil,
    accountName: nil,
    isOwner: nil,
    isCollaborator: nil,
    userId: nil,
    fullName: nil,
    emai: nil,
    roleId: nil,
    roleName: nil,
    successfulBuildNotification: nil,
    failedBuildNotification: nil,
    notifyWhenBuildStatusChangedOnly: nil,
    created: nil,
    updated: nil
  )
end

defmodule Collaborator do
  defstruct(
    accountId: nil,
    accountName: nil,
    isOwner: nil,
    isCollaborator: nil,
    userId: nil,
    fullName: nil,
    email: nil,
    roleId: nil,
    roleName: nil,
    successfulBuildNotification: nil,
    failedBuildNotification: nil,
    notifyWhenBuildStatusChangedOnly: nil,
    created: nil,
    updated: nil
  )
end

defmodule Environment do
  defstruct(
    deploymentEnvironmentId: nil,
    name: nil,
    provider: nil,
    created: nil,
    updated: nil
  )
end
