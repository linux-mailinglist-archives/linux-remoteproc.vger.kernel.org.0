Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6C02C1CAB
	for <lists+linux-remoteproc@lfdr.de>; Tue, 24 Nov 2020 05:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKXEUH (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Mon, 23 Nov 2020 23:20:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:49436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728291AbgKXEUG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Nov 2020 23:20:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606191606;
        bh=keFNKzEC0tDnKjY1DgjHhp9xvKZEghr5MC+PHOJsJz0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qWe+frhpMulFfRnCX74BayUZ8rUJSzwrqKr9opH/UCuv/XHwg4e+wLKxSFBUb8Ihj
         jcDHZkKGFW24yFaI4lFQQQYIjtHzerQExUp6Nah9kaWY3IH7zkYCeBSQQamX1fmiVI
         Y7ca+YKX+tODlxJuAgRWJ5upc3KzIy81Rg2/2hyc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom_sysmon: Constify qmi_indication_handler
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160619160615.23996.13455724599879101979.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 04:20:06 +0000
References: <20201122234540.34623-1-rikard.falkeborn@gmail.com>
In-Reply-To: <20201122234540.34623-1-rikard.falkeborn@gmail.com>
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 23 Nov 2020 00:45:40 +0100 you wrote:
> The only usage of qmi_indication_handler[] is to pass its address to
> qmi_handle_init() which accepts a const pointer. Make it const to allow
> the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - remoteproc: qcom_sysmon: Constify qmi_indication_handler
    https://git.kernel.org/andersson/remoteproc/c/dd8f52660cb1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


