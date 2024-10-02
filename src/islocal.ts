import fs from 'fs'

const isLocalPath = "isLocal"

export const isLocal = () => {
    return fs.existsSync(isLocalPath)
}