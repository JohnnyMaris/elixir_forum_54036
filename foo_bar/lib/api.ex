defmodule FooBar.API do
  use Plug.Router

  import Plug.Conn
  require Logger

  plug Plug.Logger, log: :debug

  plug :match
  plug :dispatch
  plug(Plug.Parsers, parsers: [:urlencoded, {:multipart, length: 10_000_000}])

  post "/foo_bar/import" do
    Logger.error(inspect conn.params["file"])
    #Logger.error(inspect conn.body_params["example.csv"])
    Logger.error(inspect(Plug.Conn.read_body(conn), label: "body"))
  end
end


#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  #import Plug.Multipart
#  require Logger
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#  plug(Plug.Parsers, parsers: [:urlencoded, {:multipart, length: 10_000_000}])
#
#  post "/foo_bar/import" do
#    content_type = get_req_header(conn, "content-type")
#    case content_type do
#      "multipart/form-data" ->
#        {params, file_params} = Plug.Multipart.parse(conn, opts)
#        file_content = params["file"].data
#
#        # do something with file content
#        Logger.debug("File content: #{file_content}")
#
#      _ ->
#        Logger.debug("Content type not supported: #{content_type}")
#        send_resp(conn, 415, "Unsupported Media Type")
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  require Logger
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#  plug(Plug.Parsers, parsers: [:urlencoded, {:multipart, length: 10_000_000}], buffer_size: 10_000_000)
#
#  def handle_multipart(conn) do
#    #case Plug.Parsers.MULTIPART.init(conn, %{}) do
#    case Plug.Parsers.MULTIPART.init([]) do
#      {:ok, _, _} = {:ok, params, uploads} -> # parsing is complete
#        # do something with params and uploads
#        {params, uploads}
#      {:ok, _, _} ->
#        {:ok, body, conn} = Plug.Conn.read_body(conn, :multipart)
#        handle_multipart(Plug.Parsers.MULTIPART.parse(conn, body, :strict, nil, nil))
#      {:error, _} = error ->
#        {:error, error}
#    end
#  end
#
#
#  post "/foo_bar/import" do
#    Logger.error(inspect handle_multipart(conn))
#    #case Plug.Parsers.MULTIPART.parse(conn, conn.req_headers, :strict, nil, nil) do
#    #  {:ok, params, uploads} -> 2
#    #    case Map.get(params, "file") do
#    #      nil -> 2
#    #      Logger.error('Map.get(params) -> NIL')
#    ##    #    # Handle case where file is not present
#    #      _ -> 1
#    #        file_contents = File.read!(uploads["file"].path)
#    #        Logger.error(inspect file_contents)
#    ##    #    # Do something with the file contents
#    #    end
#    #  e ->
#    #    Logger.error('MULTIPART -> _')
#    #    Logger.error(inspect e)
#    #    # Handle case where multipart parsing failed
#    #    1
#    #end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  require Logger
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#  plug(Plug.Parsers, parsers: [:urlencoded, {:multipart, length: 10_000_000}])
#
#  post "/foo_bar/import" do
#    case Plug.Parsers.MULTIPART.parse(conn, conn.req_headers, :strict, nil, nil) do
#      {:ok, params, uploads} ->
#        case Map.get(params, "file") do
#          nil ->
#            # Handle case where file is not present
#          upload ->
#            file_contents = File.read!(upload.path)
#            # Do something with the file contents
#        end
#      _ ->
#        # Handle case where multipart parsing failed
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  require Logger
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#  plug(Plug.Parsers,
#       parsers: [:urlencoded, {:multipart, length: 10_000_000}],
#       pass: ["*/*"],
#       json_decoder: Poison)
#
#  post "/foo_bar/import" do
#    {:ok, params, _conn} = Plug.Parsers.MULTIPART.parse(conn, [])
#    file = params["file"]
#    file_content = file[:body]
#    file_name = file[:filename]
#    file_type = file[:content_type]
#    # do something with the file_content, file_name, and file_type here
#  end
#end


#defmodule FooBar.API do
#  @multipart Plug.Parsers.MULTIPART
#
#  use Plug.Router
#
#  import Plug.Conn
#  require Logger
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#  plug(Plug.Parsers, parsers: [:urlencoded, {:multipart, length: 10_000_000}])
#
#  post "/foo_bar/import" do
#    content_type = get_req_header(conn, "content-type")
#    case content_type do
#      "multipart/form-data" ->
#        {params, file_params} = Plug.Multipart.parse(conn, opts)
#        file_content = params["file"].data
#
#        # do something with file content
#        Logger.debug("File content: #{file_content}")
#
#      _ ->
#        Logger.debug("Content type not supported: #{content_type}")
#        send_resp(conn, 415, "Unsupported Media Type")
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  require Logger
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#  plug(Plug.Parsers, parsers: [:urlencoded, {:multipart, length: 10_000_000}])
#
#  post "/foo_bar/import" do
#    Logger.error(inspect conn.params["file"])
#    #Logger.error(inspect conn.body_params["example.csv"])
#    Logger.error(inspect(Plug.Conn.read_body(conn), label: "body"))
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  defp extract_file(params) do
#    file = params["file"]
#
#    case file do
#      %Plug.Upload{} = upload ->
#        filename = upload.filename
#        contents = upload.data
#
#        {filename, contents}
#      nil ->
#        nil
#    end
#  end
#
#  post "/foo_bar/import" do
#    {:ok, params, _} = plug_req.multipart_params(conn)
#
#    case extract_file(params) do
#      nil ->
#        conn |> send_resp(400, "No file uploaded")
#
#      {filename, contents} ->
#        # do something with the file contents
#        conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#    end
#  end
#end


#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  post "/foo_bar/import" do
#    case Plug.Parsers.parse_multipart(conn) do
#      {:ok, params, _} ->
#        case Plug.Upload.get(params, "file") do
#          nil ->
#            conn |> send_resp(400, "No file uploaded")
#
#          file ->
#            filename = file.filename
#            contents = file.data
#
#            # do something with the file contents
#            conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#        end
#
#      {:error, _reason} ->
#        conn |> send_resp(400, "Invalid multipart form data")
#    end
#  end
#end


#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  post "/foo_bar/import" do
#    # Get the multipart parameters
#    {:ok, params, _} = Plug.Parsers.Multipart.parse_multipart(conn)
#
#    # Get the uploaded file
#    {:ok, file} = Plug.Upload.get_params(params)["file"]
#
#    case file do
#      nil ->
#        conn |> send_resp(400, "No file uploaded")
#
#      _ ->
#        filename = file.filename
#        contents = file.content_type
#
#        # do something with the file contents
#        conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  post "/foo_bar/import" do
#    case Plug.Parsers.parse_multipart(conn, []) do
#      {:ok, params, _} ->
#        case params["file"] do
#          %{filename: filename, path: path} ->
#            contents = File.read!(path)
#            # do something with the file contents
#            conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#
#          nil ->
#            conn |> send_resp(400, "No file uploaded")
#
#          _ ->
#            conn |> send_resp(400, "Invalid file uploaded")
#        end
#
#      {:error, reason, _} ->
#        conn |> send_resp(400, "Error parsing request: #{reason}")
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  plug Plug.Parsers,
#    parsers: [:urlencoded, :multipart],
#    pass: ["*/*"],
#    json_decoder: Poison
#
#  post "/foo_bar/import" do
#    case get_multipart_params(conn) do
#      {:ok, params, _} ->
#        file = params["file"]
#
#        case file do
#          nil ->
#            conn |> send_resp(400, "No file uploaded")
#
#          %Plug.Upload{filename: filename, path: path, content_type: content_type} ->
#            contents = File.read!(path)
#
#            # do something with the file contents
#            conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#
#          _ ->
#            conn |> send_resp(400, "Invalid file uploaded")
#        end
#
#      {:error, _reason} ->
#        conn |> send_resp(400, "Error parsing multipart request")
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  post "/foo_bar/import" do
#    {:ok, %Plug.Upload{filename: filename, path: path}} = Plug.Upload.parse_multipart(conn, [])
#    contents = File.read!(path)
#
#    # do something with the file contents
#
#    conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Parsers
#  import Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  post "/foo_bar/import" do
#    {:ok, %Plug.Upload{} = file} = Plug.Parsers.parse_multipart(conn, [])
#
#    filename = file.filename
#    contents = file.data
#
#    conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  post "/foo_bar/import" do
#    {_, file} = Plug.Upload.parse_multipart(conn)
#
#    case file do
#      nil ->
#        conn |> send_resp(400, "No file uploaded")
#
#      _ ->
#        filename = file.filename
#        contents = file.data
#
#        # do something with the file contents
#        conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#  require Plug.Upload
#
#  plug :match
#  plug :dispatch
#
#  post "/upload" do
#    file = get_upload(conn, "file")
#
#    case file do
#      nil ->
#        conn |> send_resp(400, "No file uploaded")
#
#      _ ->
#        filename = file.filename
#        contents = file.data
#
#        # do something with the file contents
#        conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#    end
#  end
#end

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#  require Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  post "/foo_bar/import" do
#    file = get_upload(conn, "file")
#
#    case file do
#      nil ->
#        conn |> send_resp(400, "No file uploaded")
#
#      _ ->
#        filename = file.filename
#        contents = file.data
#
#        # do something with the file contents
#        conn |> send_resp(200, "Uploaded file #{filename} with contents #{contents}")
#    end
#  end
#end
#

#defmodule FooBar.API do
#  use Plug.Router
#
#  import Plug.Conn
#  import Plug.Upload
#
#  plug Plug.Logger, log: :debug
#
#  plug :match
#  plug :dispatch
#
#  require Logger
#
#  # Add one or more
#  #post "/foo_bar/add" do
#  #  send_resp(conn, 200, "OK")
#  #end
#
#  ## Delete one or more
#  #post "/foo_bar/delete" do
#  #  send_resp(conn, 200, "OK")
#  #end
#
#  ## Start provisioning
#  #post "/foo_bar/provisioning" do
#  #  send_resp(conn, 200, "OK")
#  #end
#
#  # Import from CSV
#  post "/foo_bar/import" do
#    Logger.error("API call to import Foo")
#
#    Logger.error(inspect conn.body_parts)
#
#    file = get_upload(conn, "file")
#    Logger.error(inspect file)
#
#    send_resp(conn, 200, "OK")
#  end
#
#  # Add one or more
#  post "/foo_bar/entry1/add" do
#    send_resp(conn, 200, "OK")
#  end
#
#  # Delete one or more
#  post "/foo_bar/entry1/delete" do
#    send_resp(conn, 200, "OK")
#  end
#
#  # Start provisioning of entry1s
#  post "/foo_bar/entry1/provisioning" do
#    send_resp(conn, 200, "OK")
#  end
#
#  # Import entry1s from CSV
#  post "/foo_bar/entry1/import" do
#    send_resp(conn, 200, "OK")
#  end
#
#  post "/foo_bar/entry2/resync" do
#    send_resp(conn, 200, "OK")
#  end
#
#
#end
#
