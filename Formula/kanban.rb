class Kanban < Formula
  desc "Fast, keyboard-driven terminal kanban board"
  homepage "https://github.com/fulsomenko/kanban"
  url "https://github.com/kanban-rs/kanban/archive/refs/tags/v0.12.1.tar.gz"
  sha256 "6faa974f54abed1e536402f2edf10467549a64796caa341dea50f9fdb4a55033"
  license "Apache-2.0"
  head "https://github.com/fulsomenko/kanban.git", branch: "develop"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/kanban-cli")
    system "cargo", "install", *std_cargo_args(path: "crates/kanban-mcp")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kanban --version")
    system({ "KANBAN_FILE" => testpath/"test.json" }, bin/"kanban", "init", "--board", "BrewTest")
    assert_path_exists testpath/"test.json"
  end
end
