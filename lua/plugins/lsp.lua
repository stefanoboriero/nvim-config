return {
    'williamboman/mason.nvim',
    build = ":MasonUpdate",
    opts = {
        registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
        },
    },
}
