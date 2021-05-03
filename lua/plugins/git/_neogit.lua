local neogit = require('neogit')
local arrows = require('modules.theme.icons').arrows

-- | Keybinding   | Function                                         |
-- |--------------|--------------------------------------------------|
-- | Tab          | Toggle diff                                      |
-- | 1, 2, 3, 4   | Set a foldlevel                                  |
-- | $            | Command history                                  |
-- | b            | Branch popup                                     |
-- | s            | Stage (also supports staging selection/hunk)     |
-- | S            | Stage unstaged changes                           |
-- | \<C-s>       | Stage Everything                                 |
-- | u            | Unstage (also supports staging selection/hunk)   |
-- | U            | Unstage staged changes                           |
-- | c            | Open commit popup                                |
-- | L            | Open log popup                                   |
-- | p            | Open pull popup                                  |
-- | P            | Open push popup                                  |
-- | Z            | Open stash popup                                 |
-- | ?            | Open help popup                                  |
-- | x            | Discard changes (also supports discarding hunks) |
-- | \<enter>     | Go to file                                       |
-- | \<C-r>       | Refresh Buffer                                   |

neogit.setup {
    disable_signs = false,
    disable_context_highlighting = false,
    -- customize displayed signs
    signs = {
        -- { CLOSED, OPENED }
        section = {arrows.right, arrows.down},
        item = {arrows.right, arrows.down},
        hunk = {"", ""}
    }
}
