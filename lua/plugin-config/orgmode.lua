require('orgmode').setup_ts_grammar()

require('nvim-treesitter.configs').setup{
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'},
    },
    ensure_installed = {'org'},
}

require('orgmode').setup{
    org_agenda_files = {'~/org/Agenda/*'},
    org_default_notes_file = '~/org/refile.org',
    org_capture_templates = {
        t = {
            describe = 'Task',
            template = '* TODO %?'
        },
    },
    -- 将要做，已知问题(暂时不做), 分配给其他人做, 已完成, 放弃
    org_todo_keywords = {'TODO', '|', 'ACKNOWLEDGED', '|', 'ASSIGNMENT', '|', 'DONE', '|', 'CANCLE'}
}
